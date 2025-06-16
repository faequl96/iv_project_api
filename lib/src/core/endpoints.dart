class AuthEndpoints {
  const AuthEndpoints._();

  static const login = '/login';
}

class UserEndpoints {
  const UserEndpoints._();

  static const getUser = '/user';
  static const getUserById = '/user/id/';
  static const getUsers = '/users';
  static const updateUserById = '/user/id/';
  static const deleteUser = '/user';
  static const deleteUserById = '/user/id/';
}

class UserProfileEndpoints {
  const UserProfileEndpoints._();

  static const getUserProfile = '/user-profile';
  static const getUserProfileById = '/user-profile/id/';
  static const updateUserProfile = '/user-profile';
  static const updateUserProfileById = '/user-profile/id/';
}

class IVCoinEndpoints {
  const IVCoinEndpoints._();

  static const getIVCoin = '/iv-coin';
  static const getIVCoinById = '/iv-coin/id/';
  static const updateIVCoinById = '/iv-coin/id/';
}

class AdMobEndpoints {
  const AdMobEndpoints._();

  static const addExtraIVCoins = '/ad-mob';
}

class CategoryEndpoints {
  const CategoryEndpoints._();

  static const createCategory = '/category';
  static const getCategoryById = '/category/id/';
  static const getCategories = '/categories';
  static const updateCategoryById = '/category/id/';
  static const deleteCategoryById = '/category/id/';
}

class DiscountCategoryEndpoints {
  const DiscountCategoryEndpoints._();

  static const createDiscountCategory = '/discount-category';
  static const getDiscountCategoryById = '/discount-category/id/';
  static const getDiscountCategories = '/discount-categories';
  static const updateDiscountCategoryById = '/discount-category/id/';
  static const deleteDiscountCategoryById = '/discount-category/id/';
}

class IVCoinPackageEndpoints {
  const IVCoinPackageEndpoints._();

  static const createIVCoinPackage = '/iv-coin-package';
  static const getIVCoinPackageById = '/iv-coin-package/id/';
  static const getIVCoinPackages = '/iv-coin-packages';
  static const updateIVCoinPackageById = '/iv-coin-package/id/';
  static const deleteIVCoinPackageById = '/iv-coin-package/id/';
}

class InvitationThemeEndpoints {
  const InvitationThemeEndpoints._();

  static const createInvitationTheme = '/invitation-theme';
  static const getInvitationThemeById = '/invitation-theme/id/';
  static const getInvitationThemes = '/invitation-themes';
  static const getInvitationThemesByCategoryId = '/invitation-themes/category-id/';
  static const updateInvitationThemeById = '/invitation-theme/id/';
  static const deleteInvitationThemeById = '/invitation-theme/id/';
}

class DiscountEndpoints {
  const DiscountEndpoints._();

  static const setProductPrices = '/discount';
}

class ReviewEndpoints {
  const ReviewEndpoints._();

  static const createReview = '/review';
  static const getReviewById = '/review/id/';
  static const getReviews = '/reviews';
  static const getReviewsByInvitationThemeId = '/reviews/invitation-theme-id/';
  static const updateReviewById = '/review/id/';
  static const deleteReviewById = '/review/id/';
}

class InvitationEndpoints {
  const InvitationEndpoints._();

  static const createInvitation = '/invitation';
  static const getInvitationById = '/invitation/id/';
  static const getInvitations = '/invitations';
  static const getInvitationsByUserId = '/invitations/user-id/';
  static const updateInvitationById = '/invitation/id/';
  static const deleteInvitationById = '/invitation/id/';
}

class InvitationDataEndpoints {
  const InvitationDataEndpoints._();

  static const getInvitationDataById = '/invitation-data/id/';
  static const updateInvitationDataById = '/invitation-data/id/';
}

class TransactionEndpoints {
  const TransactionEndpoints._();

  static const createTransaction = '/transaction';
  static const getTransactionById = '/transaction/id/';
  static const getTransactions = '/transactions';
  static const getTransactionsByUserId = '/transactions/user-id/';
  static const updateTransactionById = '/transaction/id/';
  static const deleteTransactionById = '/transaction/id/';
}

class TransactionPaymentEndpoints {
  const TransactionPaymentEndpoints._();

  static const issueById = '/issue/id/';
}

class TransactionConfirmationEndpoints {
  const TransactionConfirmationEndpoints._();

  static const manualByAdminById = '/transaction-confirmation-manual/id/';
}

class VoucherCodeEndpoints {
  const VoucherCodeEndpoints._();

  static const createVoucherCode = '/voucher-code';
  static const getVoucherCodeById = '/voucher-code/id/';
  static const getVoucherCodeByName = '/voucher-code/name/';
  static const updateVoucherCodeById = '/voucher-code/id/';
  static const deleteVoucherCodeById = '/voucher-code/id/';
}
