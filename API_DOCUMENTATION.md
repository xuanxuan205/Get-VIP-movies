# API Documentation

## Overview

The Enterprise Media Content Management System provides a comprehensive RESTful API for client applications and third-party integrations. This documentation covers all available endpoints, authentication methods, and usage examples.

## Base URL

```
Production: https://api.enterprise-cms.com/v1
Staging: https://staging-api.enterprise-cms.com/v1
Development: http://localhost:5000/v1
```

## Authentication

### Bearer Token Authentication

All API requests require authentication using JWT (JSON Web Tokens). Include the token in the Authorization header:

```http
Authorization: Bearer <your-jwt-token>
```

### Obtaining Access Tokens

#### POST /auth/login

Authenticate with username/password to obtain access tokens.

**Request:**
```http
POST /auth/login
Content-Type: application/json

{
  "username": "user@example.com",
  "password": "secure_password",
  "device_fingerprint": "abc123def456"
}
```

**Response:**
```json
{
  "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "token_type": "Bearer",
  "expires_in": 3600,
  "user": {
    "id": "550e8400-e29b-41d4-a716-446655440000",
    "username": "user@example.com",
    "role": "user",
    "permissions": ["read", "write"]
  }
}
```

#### POST /auth/refresh

Refresh an expired access token using a refresh token.

**Request:**
```http
POST /auth/refresh
Content-Type: application/json

{
  "refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

**Response:**
```json
{
  "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "token_type": "Bearer",
  "expires_in": 3600
}
```

## License Management

### POST /licenses/verify

Verify a license code and bind it to a device.

**Request:**
```http
POST /licenses/verify
Authorization: Bearer <token>
Content-Type: application/json

{
  "license_code": "ENTERPRISE-2024-ABC123",
  "device_fingerprint": "abc123def456ghi789",
  "client_version": "2.1.1",
  "device_info": {
    "os": "Windows 10",
    "cpu": "Intel Core i7",
    "memory": "16GB"
  }
}
```

**Response:**
```json
{
  "status": "success",
  "license": {
    "id": "550e8400-e29b-41d4-a716-446655440000",
    "code": "ENTERPRISE-2024-ABC123",
    "status": "active",
    "expires_at": "2024-12-31T23:59:59Z",
    "features": [
      "premium_content",
      "advanced_analytics",
      "priority_support"
    ],
    "device_limit": 3,
    "devices_used": 1
  },
  "device": {
    "id": "660f9511-f3ac-52e5-b827-557766551111",
    "fingerprint": "abc123def456ghi789",
    "registered_at": "2024-01-15T10:30:00Z",
    "last_seen": "2024-01-15T10:30:00Z"
  }
}
```

### GET /licenses/{license_id}

Retrieve detailed information about a specific license.

**Request:**
```http
GET /licenses/550e8400-e29b-41d4-a716-446655440000
Authorization: Bearer <token>
```

**Response:**
```json
{
  "id": "550e8400-e29b-41d4-a716-446655440000",
  "code": "ENTERPRISE-2024-ABC123",
  "status": "active",
  "created_at": "2024-01-01T00:00:00Z",
  "expires_at": "2024-12-31T23:59:59Z",
  "features": [
    "premium_content",
    "advanced_analytics",
    "priority_support"
  ],
  "device_limit": 3,
  "devices": [
    {
      "id": "660f9511-f3ac-52e5-b827-557766551111",
      "fingerprint": "abc123def456ghi789",
      "device_info": {
        "os": "Windows 10",
        "cpu": "Intel Core i7"
      },
      "registered_at": "2024-01-15T10:30:00Z",
      "last_seen": "2024-01-15T14:22:00Z"
    }
  ],
  "usage_stats": {
    "total_activations": 1,
    "last_activation": "2024-01-15T10:30:00Z",
    "total_api_calls": 1250,
    "last_api_call": "2024-01-15T14:22:00Z"
  }
}
```

### POST /licenses/{license_id}/deactivate

Deactivate a license on a specific device.

**Request:**
```http
POST /licenses/550e8400-e29b-41d4-a716-446655440000/deactivate
Authorization: Bearer <token>
Content-Type: application/json

{
  "device_fingerprint": "abc123def456ghi789",
  "reason": "Device replacement"
}
```

**Response:**
```json
{
  "status": "success",
  "message": "License deactivated successfully",
  "license": {
    "id": "550e8400-e29b-41d4-a716-446655440000",
    "devices_used": 0,
    "device_limit": 3
  }
}
```

## Device Management

### GET /devices

List all devices associated with the authenticated user.

**Request:**
```http
GET /devices?page=1&limit=20&status=active
Authorization: Bearer <token>
```

**Response:**
```json
{
  "devices": [
    {
      "id": "660f9511-f3ac-52e5-b827-557766551111",
      "fingerprint": "abc123def456ghi789",
      "name": "Work Laptop",
      "status": "active",
      "device_info": {
        "os": "Windows 10 Pro",
        "cpu": "Intel Core i7-10700K",
        "memory": "16GB DDR4",
        "storage": "512GB SSD"
      },
      "registered_at": "2024-01-15T10:30:00Z",
      "last_seen": "2024-01-15T14:22:00Z",
      "license": {
        "id": "550e8400-e29b-41d4-a716-446655440000",
        "code": "ENTERPRISE-2024-ABC123"
      }
    }
  ],
  "pagination": {
    "page": 1,
    "limit": 20,
    "total": 1,
    "pages": 1
  }
}
```

### PUT /devices/{device_id}

Update device information.

**Request:**
```http
PUT /devices/660f9511-f3ac-52e5-b827-557766551111
Authorization: Bearer <token>
Content-Type: application/json

{
  "name": "Updated Device Name",
  "device_info": {
    "os": "Windows 11 Pro",
    "memory": "32GB DDR4"
  }
}
```

**Response:**
```json
{
  "id": "660f9511-f3ac-52e5-b827-557766551111",
  "fingerprint": "abc123def456ghi789",
  "name": "Updated Device Name",
  "status": "active",
  "device_info": {
    "os": "Windows 11 Pro",
    "cpu": "Intel Core i7-10700K",
    "memory": "32GB DDR4",
    "storage": "512GB SSD"
  },
  "updated_at": "2024-01-15T15:00:00Z"
}
```

## Administrative Endpoints

### GET /admin/licenses

List all licenses in the system (Admin only).

**Request:**
```http
GET /admin/licenses?page=1&limit=50&status=active&sort=created_at&order=desc
Authorization: Bearer <admin-token>
```

**Response:**
```json
{
  "licenses": [
    {
      "id": "550e8400-e29b-41d4-a716-446655440000",
      "code": "ENTERPRISE-2024-ABC123",
      "user": {
        "id": "770f9511-f3ac-52e5-b827-557766552222",
        "username": "user@example.com"
      },
      "status": "active",
      "created_at": "2024-01-01T00:00:00Z",
      "expires_at": "2024-12-31T23:59:59Z",
      "device_count": 1,
      "device_limit": 3,
      "last_activity": "2024-01-15T14:22:00Z"
    }
  ],
  "pagination": {
    "page": 1,
    "limit": 50,
    "total": 1,
    "pages": 1
  },
  "summary": {
    "total_licenses": 1,
    "active_licenses": 1,
    "expired_licenses": 0,
    "revoked_licenses": 0
  }
}
```

### POST /admin/licenses

Create a new license (Admin only).

**Request:**
```http
POST /admin/licenses
Authorization: Bearer <admin-token>
Content-Type: application/json

{
  "code": "ENTERPRISE-2024-DEF456",
  "user_id": "770f9511-f3ac-52e5-b827-557766552222",
  "expires_at": "2024-12-31T23:59:59Z",
  "device_limit": 5,
  "features": [
    "premium_content",
    "advanced_analytics",
    "priority_support",
    "api_access"
  ]
}
```

**Response:**
```json
{
  "id": "881f9511-f3ac-52e5-b827-557766553333",
  "code": "ENTERPRISE-2024-DEF456",
  "user_id": "770f9511-f3ac-52e5-b827-557766552222",
  "status": "active",
  "created_at": "2024-01-15T15:30:00Z",
  "expires_at": "2024-12-31T23:59:59Z",
  "device_limit": 5,
  "features": [
    "premium_content",
    "advanced_analytics",
    "priority_support",
    "api_access"
  ]
}
```

### PUT /admin/licenses/{license_id}/status

Update license status (Admin only).

**Request:**
```http
PUT /admin/licenses/550e8400-e29b-41d4-a716-446655440000/status
Authorization: Bearer <admin-token>
Content-Type: application/json

{
  "status": "suspended",
  "reason": "Payment overdue",
  "notify_user": true
}
```

**Response:**
```json
{
  "id": "550e8400-e29b-41d4-a716-446655440000",
  "status": "suspended",
  "updated_at": "2024-01-15T16:00:00Z",
  "status_history": [
    {
      "status": "suspended",
      "reason": "Payment overdue",
      "changed_by": "admin@example.com",
      "changed_at": "2024-01-15T16:00:00Z"
    }
  ]
}
```

## Analytics & Reporting

### GET /analytics/usage

Get usage analytics for the authenticated user.

**Request:**
```http
GET /analytics/usage?period=30d&granularity=daily
Authorization: Bearer <token>
```

**Response:**
```json
{
  "period": {
    "start": "2023-12-16T00:00:00Z",
    "end": "2024-01-15T23:59:59Z",
    "granularity": "daily"
  },
  "metrics": {
    "total_api_calls": 15750,
    "unique_devices": 2,
    "active_days": 28,
    "average_daily_usage": 562
  },
  "timeline": [
    {
      "date": "2024-01-15",
      "api_calls": 1250,
      "unique_devices": 1,
      "features_used": ["premium_content", "analytics"]
    }
  ],
  "top_features": [
    {
      "feature": "premium_content",
      "usage_count": 8500,
      "percentage": 54.0
    },
    {
      "feature": "analytics",
      "usage_count": 4200,
      "percentage": 26.7
    }
  ]
}
```

### GET /admin/analytics/system

Get system-wide analytics (Admin only).

**Request:**
```http
GET /admin/analytics/system?period=7d
Authorization: Bearer <admin-token>
```

**Response:**
```json
{
  "period": {
    "start": "2024-01-08T00:00:00Z",
    "end": "2024-01-15T23:59:59Z"
  },
  "overview": {
    "total_users": 1250,
    "active_users": 890,
    "total_licenses": 1500,
    "active_licenses": 1200,
    "total_devices": 2100,
    "active_devices": 1800
  },
  "growth": {
    "new_users": 45,
    "new_licenses": 38,
    "new_devices": 67
  },
  "revenue": {
    "total": 125000.00,
    "currency": "USD",
    "growth_percentage": 12.5
  },
  "top_features": [
    {
      "feature": "premium_content",
      "users": 750,
      "usage_percentage": 84.3
    }
  ]
}
```

## Error Handling

### Error Response Format

All API errors follow a consistent format:

```json
{
  "error": {
    "code": "INVALID_LICENSE",
    "message": "The provided license code is invalid or expired",
    "details": {
      "license_code": "INVALID-CODE-123",
      "reason": "License not found in database"
    },
    "timestamp": "2024-01-15T16:30:00Z",
    "request_id": "req_abc123def456"
  }
}
```

### HTTP Status Codes

| Status Code | Description |
|-------------|-------------|
| 200 | OK - Request successful |
| 201 | Created - Resource created successfully |
| 400 | Bad Request - Invalid request parameters |
| 401 | Unauthorized - Authentication required |
| 403 | Forbidden - Insufficient permissions |
| 404 | Not Found - Resource not found |
| 409 | Conflict - Resource already exists |
| 422 | Unprocessable Entity - Validation errors |
| 429 | Too Many Requests - Rate limit exceeded |
| 500 | Internal Server Error - Server error |
| 503 | Service Unavailable - Service temporarily unavailable |

### Common Error Codes

| Error Code | Description |
|------------|-------------|
| `INVALID_CREDENTIALS` | Username or password is incorrect |
| `TOKEN_EXPIRED` | JWT token has expired |
| `INVALID_TOKEN` | JWT token is malformed or invalid |
| `INSUFFICIENT_PERMISSIONS` | User lacks required permissions |
| `INVALID_LICENSE` | License code is invalid or expired |
| `DEVICE_LIMIT_EXCEEDED` | Maximum device limit reached |
| `LICENSE_SUSPENDED` | License has been suspended |
| `DEVICE_NOT_AUTHORIZED` | Device is not authorized for this license |
| `RATE_LIMIT_EXCEEDED` | API rate limit has been exceeded |
| `VALIDATION_ERROR` | Request validation failed |

## Rate Limiting

API requests are subject to rate limiting to ensure fair usage and system stability.

### Rate Limit Headers

All API responses include rate limit information in headers:

```http
X-RateLimit-Limit: 1000
X-RateLimit-Remaining: 999
X-RateLimit-Reset: 1642262400
X-RateLimit-Window: 3600
```

### Rate Limit Tiers

| User Type | Requests per Hour | Burst Limit |
|-----------|-------------------|-------------|
| Free | 100 | 10 |
| Premium | 1,000 | 50 |
| Enterprise | 10,000 | 200 |
| Admin | 50,000 | 1,000 |

## SDK and Libraries

### Official SDKs

- **Python SDK**: `pip install enterprise-cms-sdk`
- **JavaScript SDK**: `npm install @enterprise-cms/sdk`
- **C# SDK**: Available via NuGet
- **Java SDK**: Available via Maven Central

### Python SDK Example

```python
from enterprise_cms import Client

# Initialize client
client = Client(
    base_url="https://api.enterprise-cms.com/v1",
    api_key="your-api-key"
)

# Authenticate
auth_response = client.auth.login(
    username="user@example.com",
    password="password",
    device_fingerprint="abc123"
)

# Verify license
license_response = client.licenses.verify(
    license_code="ENTERPRISE-2024-ABC123",
    device_fingerprint="abc123def456"
)

print(f"License status: {license_response.license.status}")
```

### JavaScript SDK Example

```javascript
import { EnterpriseClient } from '@enterprise-cms/sdk';

// Initialize client
const client = new EnterpriseClient({
  baseUrl: 'https://api.enterprise-cms.com/v1',
  apiKey: 'your-api-key'
});

// Authenticate
const authResponse = await client.auth.login({
  username: 'user@example.com',
  password: 'password',
  deviceFingerprint: 'abc123'
});

// Verify license
const licenseResponse = await client.licenses.verify({
  licenseCode: 'ENTERPRISE-2024-ABC123',
  deviceFingerprint: 'abc123def456'
});

console.log(`License status: ${licenseResponse.license.status}`);
```

## Webhooks

### Webhook Events

The system can send webhook notifications for various events:

| Event Type | Description |
|------------|-------------|
| `license.activated` | License activated on a new device |
| `license.deactivated` | License deactivated from a device |
| `license.expired` | License has expired |
| `license.suspended` | License has been suspended |
| `device.registered` | New device registered |
| `user.created` | New user account created |
| `payment.received` | Payment processed successfully |

### Webhook Payload Example

```json
{
  "event": "license.activated",
  "timestamp": "2024-01-15T16:30:00Z",
  "data": {
    "license": {
      "id": "550e8400-e29b-41d4-a716-446655440000",
      "code": "ENTERPRISE-2024-ABC123"
    },
    "device": {
      "id": "660f9511-f3ac-52e5-b827-557766551111",
      "fingerprint": "abc123def456ghi789"
    },
    "user": {
      "id": "770f9511-f3ac-52e5-b827-557766552222",
      "username": "user@example.com"
    }
  }
}
```

---

For additional support or questions about the API, please contact our developer support team at api-support@enterprise-cms.com.