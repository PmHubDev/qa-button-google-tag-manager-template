___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Permate Button Tag",
  "categories": ["AFFILIATE_MARKETING", "ADVERTISING", "ATTRIBUTION"],
  "brand": {
    "id": "brand_dummy",
    "displayName": ""
  },
  "description": "Add script to page",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "tracking_domain",
    "simpleValueType": true,
    "defaultValue": "https://qa.pmdevtk.com",
    "displayName": "Tracking Domain"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Nhập mã mẫu của bạn tại đây.
const log = require('logToConsole');
const getCookieValues = require('getCookieValues');
const getUrl = require('getUrl');
const getTimestampMillis = require('getTimestampMillis');
const injectScript = require('injectScript');
const encodeUriComponent = require('encodeUriComponent');
const addConsentListener = require('addConsentListener');

const TRACKING_DOMAIN = data.tracking_domain;
const SCRIPT_URL = TRACKING_DOMAIN + '/get_url/button';

function loadScript() {
  let cep = getCookieValues('pm_cep_o')[0];
  let currentUrl = getUrl();
  let delimiter = currentUrl.indexOf('?') > -1 ? '&' : '?';
  currentUrl += delimiter + 'pm_cep=' + cep;
  let scriptUrl = SCRIPT_URL + '?location=o&url=' + encodeUriComponent(currentUrl) + '&time=' + getTimestampMillis();
  injectScript(scriptUrl);
}

function processData() {
  if (!TRACKING_DOMAIN) {
    log('TRACKING_DOMAIN is undefined');
    return;
  }
  let cep = getCookieValues('pm_cep_o')[0];
  if (cep) {
    loadScript(cep);
  }
}

processData();

data.gtmOnSuccess();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "all"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "get_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "cookieAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "get_url",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urlParts",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "queriesAllowed",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://qa.pmdevtk.com/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_consent",
        "versionId": "1"
      },
      "param": []
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []
setup: ''


___NOTES___

Created on 11/26/2024, 3:00:35 PM


