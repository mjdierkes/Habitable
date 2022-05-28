"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const UserModel_1 = __importDefault(require("../models/UserModel"));
const catchAsync_1 = __importDefault(require("../utils/catchAsync"));
const router = express_1.default.Router();
// Create
router.post("/", (0, catchAsync_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { username, password, name } = req.body;
    const user = yield UserModel_1.default.create({ name, username, password });
    yield user.save();
    return res.send(user);
})));
router.get("/:username/groups", (0, catchAsync_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { username } = req.params;
    const user = yield UserModel_1.default.findOne({ username }).populate({
        path: "groups",
        model: "Group"
    });
    return res.send(user.groups);
})));
router.get("/:username/tasks", (0, catchAsync_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { username } = req.params;
    const user = yield UserModel_1.default.findOne({ username }).populate({
        path: "groups",
        model: "Group"
    });
})));
exports.default = router;
//# sourceMappingURL=userRoutes.js.map