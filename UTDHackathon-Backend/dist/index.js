"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const mongoose_1 = __importDefault(require("mongoose"));
const userRoutes_1 = __importDefault(require("./routes/userRoutes"));
const groupRoutes_1 = __importDefault(require("./routes/groupRoutes"));
const app = (0, express_1.default)();
const PORT = process.env.PORT || 8080;
app.use(express_1.default.json());
app.use("/users", userRoutes_1.default);
app.use("/groups", groupRoutes_1.default);
mongoose_1.default.connect("mongodb+srv://sumitn:1234@cluster0.tmmpa.mongodb.net/?retryWrites=true&w=majority");
app.listen(PORT, () => {
    // tslint:disable-next-line:no-console
    console.log(`Express app listening on PORT ${PORT}`);
});
app.get("/", (req, res) => {
    res.send("Hello World");
});
// Generic error handler
app.use((err, req, res, next) => {
    const { message } = err;
    res.status(500).send(message);
});
//# sourceMappingURL=index.js.map