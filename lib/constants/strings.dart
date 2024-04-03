abstract class Strings {
  static const emailRegex =
      '^[A-Za-z0-9](\\.?[A-Za-z0-9_-]){0,}@[A-Za-z0-9-]+\\.([A-Za-z]{1,6}\\.)?[A-Za-z]{2,6}\$';

  static RegExp loginIDAndPasswordExp = RegExp(r'^[a-zA-Z0-9-_.+@$!#]+$');

  static const databaseName = 'exot_db';

  static const appName = 'Your App';
  static const synkratoApp = 'Synkrato';

  static const locale = 'locale';
  static const hiLocale = 'hi';
  static const enLocale = 'en';
  static const countryCodeKey = 'countryCode';
  static const usCountryValue = 'US';
  static const inCountryValue = 'IN';

  static const currentInstance = 'Current Instance :';
  static const password = 'Password';
  static const emailAddress = 'Username or email';
  static const usernameValidationError1 = 'Minimum 3 characters required';
  static const usernameValidationError2 = 'Maximum 320 characters only allowed';
  static const usernameValidationError3 =
      'Only words, digits and Special(-_.+@\$!#) characters allowed';
  static const passwordValidationError1 = 'Minimum 7 characters required';
  static const passwordValidationError2 = 'Maximum 40 characters only allowed';
  static const scan = 'Scan';
  static const signIn = 'Sign in';
  static const signInWith = 'or sign in with';
  static const microsoft = 'Microsoft';
  static const ssoLoginError =
      'User account not allowed to login through single sign on';
  static const next = 'Next';
  static const signInContinue = 'to continue to ';

  static const projectName = 'exto';
  static const version = 'version';
  static const rememberMe = 'Remember me';
  static const forgotPassword = 'Forgot password?';
  static const forgotPasswordMessage = 'Fill the form to reset your password';
  static const sendResetLink = 'Send link';
  static const returnTo = 'Return to ';
  static const sentSuccessfully = 'Link sent successfully';
  static const checkInstruction =
      'Please check your email and follow the instructions to reset your password.';

  static const invalidUsernamePassword =
      'Please enter valid username and password !';

  static const platform = 'Platform';
  static const extoSubTitle = 'Project Monitoring Tool';
  static const point1 = 'Does not sell or trade your data';
  static const point2 = 'Is certified for information security';
  static const point3 = 'Encrypts and secures your data';

  //Tenant screen
  static const chooseCustomers = 'Choose customer';
  static const multipleCustomersMsg =
      'You are associated with multiple customers. Please select a customer to continue.';

  // Errors
  static const workflowRefIdError =
      'Workflow Step and Forms are not linked. Contact system administrator';
  static const formInvalid = 'Please fill the mandatory fields';
  static const noPermissionToAction =
      'This user has no permission to do any action';
  static const requiredFields = 'Please fill username and password';
  static const invalidUrl = 'Invalid URL';
  static const qrNotScanned = 'No QR Code scanned.';

  static const logout = 'Log out';
  static const home = 'Go to home screen';
  static const dashboard = 'Dashboard';
  static const dashboards = 'Dashboards';
  static const progressAndChecklist = 'Progress & Checklist';
  static const customForm = 'Custom Forms';
  static const search = 'Search';

  static const failedOperation = 'Operation Failed';
  static const customersScreenTitle = 'Customers';
  static const workspaceScreenTitle = 'Workspaces';
  static const projectsScreenTitle = 'Projects';
  static const modulesScreenTitle = 'Modules';
  static const recordsScreenTitle = 'Records';
  static const formsScreenTitle = 'Forms';

  static const styleHeightKey = 'height';
  static const checkListTitleLabel = 'Sno : ';
  static const checkListDescLabel = 'Description : ';
  static const checkListNoteLabel = 'Note : ';
  static const checkListAnswerLabel = 'Answers : ';
  static const checkListAttachmentActionLabel = 'Attachment';
  static const checkListIssueActionLabel = 'Issue';
  static const checkListNewActionLabel = 'new';

  static const customerSelection = 'Customer Selection';
  static const customerSelectionMenuItem = 'Select Customer';
  static const projectSelectionMenuItem = 'Select Project';

  static const storageOperationsFailure = 'storage operation failed : ';
  static const emptyData = 'No Data Available.';
  static const requiredField = 'This field is required';
  static const no = 'No';
  static const yes = 'Yes';
  static const confirmationTitle = 'Confirmation';
  static const confirmMessage = 'Are you sure?';
  static const exitApplication = 'Do you want to exit Exto?';
  static const logoutApplication = 'Do you want to log out?';
  static const discardWarning =
      'There are some unsaved changes. Are you sure you want to exit?';
  static const confirmBeforeSubmit = 'Are you sure? You want to ';
  static const confirmBeforeDelete =
      'Are you sure? You want to delete this item?';
  static const projectSpace = 'Project Space';
  static const project = 'Project';
  static const changeAssignee = 'Change Assignee';

  static const emptyFields = 'Fields are empty';
  static const changePasswordFailure = 'Failed to change the password';

  static const mainFormErrors = 'Main Form Errors';
  static const errors = 'Errors';

  //Workflow messages
  static const workflowAccessNotFound = 'Workflow access not found';
  static const lackOfPermission = 'You do not have permission to this module';
  static const noWorkFlowId = 'No Workflow Id Found';
  static const mandatoryIndicator = ' *';

  //filter texts
  static const filterCombinationAnd = 'Match All';
  static const filterCombinationOr = 'Match Any';
  static const filterApplyButtonText = 'Apply';
  static const filterCancelButtonText = 'Cancel';
  static const filterAddRuleButtonText = 'Add Rule';
  static const filterRemoveRuleButtonText = 'Remove Rule';

  static const attachFrom = 'Attach from';
  static const gallery = 'Gallery';
  static const camera = 'Camera';
  static const widgets = 'Widgets';
  static const comments = 'Comments';
  static const attachments = 'Attachments';
  static const generalAttachments = 'General Attachments';
  static const enableGeneralAttachments =
      '* To enable attachments "save" the record';
  static const checkListAttachments = 'Checklist attachments';
  static const responsiblePerson = 'Responsible Person';
  static const deleteButtonText = 'Delete';
  static const scannerPlatformError = 'Failed to get platform version.';
  static const failedSyncOfflineData =
      'It seems that there were errors while synchronizing the offline data.';
  static const offlineSyncError = 'Offline Sync Error';
  static const downloadFileError =
      'Error on downloading the file, please try again later.';
  static const needPermissions = 'Need permissions to save file in the storage';
  static const openSettings = 'Please enable permissions from app settings';
  static const downloadBasePath = '/storage/emulated/0/Download/';
  static const unknownError = 'Something went wrong';
  static const retry = 'Retry';

  // Map keys
  static const dataKey = 'data';
  static const isLocalKey = 'is_local';
  static const idKey = '_id';
  static const refIdKey = 'refID';
  static const metaKey = 'meta';
  static const createdAtKey = 'created_at';
  static const createdByKey = 'created_by';
  static const statusKey = 'status';
  static const actionKey = 'action';
  static const commentKey = 'comment';

  // Parameters
  static const formIdParam = 'form_id';
  static const moduleNameParam = 'module_name';
  static const draftRecord = 'Draft Record';

  // Record status
  static const inProcess = 'IN_PROCESS';
  static const approved = 'Approved';
  static const rejected = 'Rejected';
  static const requestReview = 'REQUEST_FOR_REVIEW';

  // Workflow actions
  static const submit = 'Submit';
  static const submitted = 'Submitted';
  static const approve = 'Approve';
  static const reject = 'Reject';
  static const returnn = 'Return';
  static const returned = 'Returned';
  static const withdraw = 'Withdraw';
  static const withdrawn = 'Withdrawn';
  static const revoke = 'Revoke';
  static const reopen = 'Reopen';
  static const reopened = 'Reopened';

  // Strings
  static const choose = 'Choose';
  static const workflowActionTitle = 'Workflow Action';
  static const workflowDoneText = 'Done';
  static const workflowCloseText = 'Close';
  static const workflowSuccessMessage = 'Successfully Done';
  static const searchHintText = 'Search..';
  static const saveAsDraft = 'Save as Draft';
  static const formula = 'FORMULA';
  static const autoComplete = 'AUTO_COMPLETE';
  static const extPopulate = 'EXT_POPULATE';
  static const column = 'COLUMN';
  static const twoColLayout = 'TWO_COL_LAYOUT';
  static const threeColLayout = 'THREE_COL_LAYOUT';
  static const sectionLayout = 'SECTION_LAYOUT';
  static const cancel = 'Cancel';
  static const row = 'Row';
  static const listItemSymbol = '•';
  static const table = 'TABLE';
  static const text = 'TEXT';

  // Workspace & Projects
  static const workspaceCaption = 'Please select a workspace to continue!';
  static const chooseWorkspace = 'Choose Workspace';
  static const projectCaption = 'Please select a project to continue!';

  // DrawerMenuItems (menu options)
  static const menuTitleMyTask = 'My Task';
  static const menuTitleFavourites = 'Favourites';
  static const menuTitleModules = 'Modules';
  static const menuTitleMaster = 'Master';
  static const menuTitleWorkspaces = 'Workspaces';
  static const menuTitleProjects = 'Projects';
  static const menuTitleSettings = 'Settings';

  //profile
  static const myAccount = 'My Account';
  static const account = 'Account';
  static const general = 'General';
  static const personal = 'PERSONAL';
  static const preferences = 'PREFERENCES';
  static const more = 'MORE';
  static const fullname = 'Full name';
  static const usernameEmail = 'Username/Email';
  static const email = 'Email';
  static const accountSettings = 'Account Settings';
  static const changePassword = 'Change Password';
  static const resetPassword = 'Reset Password';
  static const other = 'Other';
  static const experimentalFeatures = 'Experimental Features';
  static const signOut = 'Sign Out';
  static const profileInformation = 'Profile Information';
  static const firstNameLastName = 'First Name & Last Name';
  static const firstName = 'First Name';
  static const lastName = 'Last Name';
  static const confirm = 'Confirm';
  static const uploadPhoto = 'Upload Photo';
  static const upload = 'Upload';
  static const name = 'Name';
  static const chooseDateFormat = 'Choose Date Format';
  static const small = 'Small';
  static const medium = 'Medium';
  static const large = 'Large';
  static const dark = 'Dark';
  static const light = 'Light';
  static const passwordDescription =
      'Your password must be at least six characters and should include one uppercase letter.';

  // Change password screen
  static const currentPassword = 'Current Password';
  static const currentPasswordHint = 'Enter Current Password';
  static const newPassword = 'New Password';
  static const newPasswordHint = 'Generate new password';
  static const confirmPassword = 'Repeat Password';
  static const confirmPasswordHint = 'Confirm Password';
  static const passwordMismatch = 'Password do not match';

  // Account settings screen
  static const theme = 'Theme';
  static const dateFormat = 'Date Format';
  static const fontSize = 'Font Size';

  static const lightTheme = 'Light';
  static const mediumFontSize = 'Medium';

  //Table Records Constants
  static const tableData = 'subTableData';
  static const recordsData = 'records';
  static const deleteData = 'deleted';
  static const filerText = 'Filter';
  static const editTitle = 'Edit';
  static const noString = 'No';
  static const yesString = 'Yes';
  static const yesFieldValue = 'Y';
  static const noFieldValue = 'N';

  //Table cases
  static const tableString = 'STRING';
  static const tableDigit = 'NUMBER';
  static const tableDate = 'DATE';
  static const tableCheckBox = 'CHECKBOX';
  static const tableSelect = 'SELECT';

  //Reference Table ID Constants.
  static const referenceIDSubmitLabel = 'label';
  static const referenceIDSubmitValue = 'value';
  static const referenceIDSubmitRefId = 'refId';
  static const referenceIDRecords = 'records';
  static const referenceIDTitleName = 'Reference ID';

  //Module Records constants
  static const moduleName = 'moduleName';
  static const gen2 = 'GEN2';

  //Data-Set ID constants
  static const query = 'query=&filterType=&filterValue=';

  //Master Records constants
  static const masterRefId = 'masterRefId';
  static const workspaceRefId = 'workspaceRefId';
  static const refId = 'refId';
  static const level = 'level';
  static const formIdMissingMsg =
      'Please create a form for this master first to use this function';
  static const masterKey = 'MASTER';
  static const moduleKey = 'MODULE';

  static const pageKey = 'page';
  static const pageSizeKey = 'pageSize';
  static const pageSizeValue = '25';
  static const queryKey = 'query';
  static const paramKey = 'params';

  static const extService = 'EXT_SERVICE';

  static const workSpaceNotSelectedMessage = 'Please select the workspace';
  static const projectNotSelectedMessage = 'Please select the project';

  static const notApplicable = 'NotApplicable';
  static const warnMessage = 'Make sure the field has correct answer';

  static const save = 'Save';

  static const warning = 'Warning';
  static const rootMessage =
      'This device is rooted.\nThe application cannot run on rooted device';
  static const quit = 'Quit';
  static const nativeModulesWarning = 'Native modules are not supported';

  //static constant to use in ExtoHeader
  static const space = 'Space';
  static const spaces = 'Spaces';
  static const customer = 'Customer';
  static const customers = 'Customers';
  static const workarea = 'Project';
  static const workareas = 'Projects';
  static const workSpace = 'Workspace';
  static const workSpaces = 'Workspaces';
  static const checklist = 'checklist';

  ///Workflow actions button colors
  static const primary = 'PRIMARY';
  static const secondary = 'SECONDARY';
  static const danger = 'DANGER';
  static const success = 'SUCCESS';


  ///Field Form Type
  static const fieldNumber = 'NUMBER';
  static const fieldText = 'TEXT';
  static const fieldDate = 'DATE';

  static const error = 'Error';

  static const selectAction = 'Select Action';
  static const comment = 'Comment';
  static const workflow = 'Workflow';
  static const scanningInstructions = 'Scanning instructions';
  static const workflowEnd = '__END__';

  ///Geolocation const
  static const locationPermissionReq =
      'Location permission is required by the customer, Please allow the location permission.';
  static const goToSettings = 'Go to settings';
  static const disableMockLocation =
      'Mock location is enabled, Kindly disable the mock location and try again.';

  static const maximumLoginIdSize = 320;
  static const minimumLoginIdSize = 3;

  static const minimumPasswordSize = 7;
  static const maximumPasswordSize = 40;

  static const dateFormatOptions = [
    'dd/MMM/yyyy',
    'MMM/dd/yyyy',
    'MMM/dd/yy',
    'dd/MMM/yy',
    'dd/MM/yyyy',
    'MM/dd/yyyy',
    'dd/MM/yy',
    'MM/dd/yy',
    'MMM/dd',
    'MM/dd',
  ];

  static const int startDate = 1900;
  static const int endDate = 2100;

  static const defaultDateFormat = 'dd/MMM/yyyy';
  static const utcFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'";
  static const fieldsDateFormat = 'yyyy-MM-dd';
  static const dateFormatForRecords = 'yyyy-MM-dd HH:mm:ss';

  ///Dashboard related messages
  static const noDashboard = 'No dashboard configured';
  static const noPermissionDashboard =
      "You don't have permission to access the dashboard. Kindly contact the admin";

  static const recordYetTobeGenerated = 'Record # Yet To be Generated';
  static const deleteThisRow = 'Are you sure? You want to remove selected row?';

  //offline Mode

  static const mb = 'MB';
  static const syncAllOfflineModules = 'Sync All Offline Modules';
  static const syncAllOfflineModulesAgain = 'Sync All Offline Modules Again';
  static const noOfflineModules = 'No Offline Modules Available';
  static const waitingForInternetConnection = 'Waiting for Internet Connection';
  static const thisModuleIsOffline = 'This Module is Offline';
  static const makeModuleOffline = 'Make Module Offline';
  static const makeOffline = 'Make Offline';
  static const loginOffline = 'offLineLogin';
  static const userCredentialsOffline = 'userCredentialsOffline';
  static const loadAllCustomersOffline = 'offLineCustomers';
  static const selectedCustomerOffline = 'customerOffline';
  static const loadAllWorkSpacesOffline = 'offLineWorkspaces';
  static const loadAllProjectsOffline = 'loadAllProjectsOffline';

  static const saveAllProjectsOffline = 'saveAllProjectsOffline';
  static const loadAllMenusOffline = 'offLineAllMenus';
  static const loadAllMenusFailedOffline = 'offLineAllMenusFailed';
  static const saveAllMenusForOffline = 'saveAllMenusForOffline';
  static const offlineSubmit = 'OfflineSubmitted';
  static const offlineDraft = 'offlineDraft';
  static const offlineStorage = 'offlineStorage';
  static const failed = 'failed';
  static const storage = 'STORAGE';
  static const resetOfflineModule = 'Reset Offline Modules';
  static const offlineStorageSize = 'Offline Storage Size';
  static const listOfModulesOffline = 'listOfOffline';
  static const selectedModuleOffline = 'selectedModuleOffline';

  static const internetConnectionMessage =
      'Please check your internet connection';

  static const makeModuleOfflineMessage = 'Module made offline successfully';

  static const allModuleSynchronized = 'All modules synchronized successfully';

  static const supportOfflineMessage =
      'Currently we only support form with Text,Number, Date';

  static const removedAllOffline = 'All modules removed from offline.';

  static const madeOfflineModuleFailed = 'Module made offline failed';

  static const moduleRemoveFromOffline = 'Module removed from offline';

  static const commentsStepTitle = 'StepName';
  static const commentsStatusTitle = 'Status';
}
