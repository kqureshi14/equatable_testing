abstract class Api {
  static const connectionTimeout = 30000;

  // header keys
  static const headerContentTypeKey = 'Content-Type';
  static const headerContentTypeValue = 'application/json';
  static const headerTokenKey = 'token';
  static const headerAuthKey = 'authorization';
  static const headerTenantKey = 'X-TENANT-ID';
  static const headerProjectKey = 'X-PROJECT-ID';
  static const headerWorkspaceKey = 'X-WORKSPACE-ID';
  static const headerContextIdKey = 'X-Ctx-Id';
  static const headerContextTypeKey = 'X-Ctx-Type';
  static const headerContextNameKey = 'X-Ctx-Name';
  static const headerContextTypeValue = 'PROJECT';
  static const headerCookieKey = 'cookie';
  static const cookieExtoSid = 'exto_sid';
  static const authBearer = 'Bearer ';

  //Upload request form data keys
  static const uploadModule = 'module';
  static const uploadLinkedID = 'linkedID';
  static const uploadID = 'ID';
  static const uploadLinkedRefID = 'linkedRefID';
  static const uploadFile = 'file';
  static const uploadParentID = 'parentID';
  static const uploadMeta = 'meta';
  static const uploadFileSize = 'size';

  // Error Messages:
  static const noConnection = 'No Internet connection';
  static const connectionFailurePrefixMessage =
      'Error occured while Communication with Server with StatusCode : ';
  static const invalidRequest = 'Invalid Request: ';
  static const unauthorizedRequest = 'Unauthorized';
  static const requiredField = 'Required Field';
  static const communicationError = 'Error During Communication: ';

  //base URLs
  static const v4 = '/v4';
  static const apiVersion = 'api/v1';
  static const apiVersion2 = 'node/api/v2';
  static const apiVersion3 = 'rest/api/v3';
  static const apiV3 = 'api/v3';
  static const apiVersion4 = 'rest/api/v4';
  static const rest = 'rest/';
  static const node = 'node/';
  static const prodURL = 'https://platform.exto360.com/';
  static const baseURL = 'https://platformdev.exto360.com/';
  static const canaryURL = 'https://canary.exto360.com/';

  static const platformQaURL = 'https://platformqa.exto360.com/';
  static const qaURL = 'https://qa.exto360.com/';
  static const synkratoURL = 'https://demo-us.synkrato.com/';
  static const devBaseURL = 'https://kfdev.exto360.com/';
  static const dprBaseURL = 'https://platformdev.exto360.com/';

  //screen endpoints
  static const login = 'api/auth/login';
  static const microsoft = '$apiVersion2/oauth/microsoft';



  static const accessToken = 'rest/api/auth/access-token';
  static const accessTokenSSO = 'api/auth/generate-sso-access-token';








}
