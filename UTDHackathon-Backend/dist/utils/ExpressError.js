// class ExpressError extends Error {
//     constructor(status: any, message: any) {
//         super();
//         this.message = message;
//         this.status = status
//     }
// };
// module.exports = ExpressError;
class ExpressError extends Error {
    constructor(test, message) {
        super();
        this.message = message;
        this.test = test;
    }
}
//# sourceMappingURL=ExpressError.js.map