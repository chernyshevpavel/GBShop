import Vapor

func routes(_ app: Application) throws {
    let authController = AuthController()
    app.post("register", use: authController.register)
    app.post("logout", use: authController.logout)
    app.post("login", use: authController.login)
    app.post("userChange", use: authController.userChange)
    let productController = ProductController()
    app.get("getProductById", use: productController.getById)
    app.get("getProductList", use: productController.list)
    let productReviewController = ProductReviewController()
    app.get("getProductReviews", use: productReviewController.list)
    app.post("addProductReview", use: productReviewController.create)
}
