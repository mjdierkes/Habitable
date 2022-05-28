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
const TaskModel_1 = __importDefault(require("../models/TaskModel"));
const uuid_1 = require("uuid");
const GroupModel_1 = __importDefault(require("../models/GroupModel"));
const UserModel_1 = __importDefault(require("../models/UserModel"));
const catchAsync_1 = __importDefault(require("../utils/catchAsync"));
const router = express_1.default.Router();
// Create
router.post("/", (0, catchAsync_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { name, description } = req.body;
    const groupID = (0, uuid_1.v4)();
    const group = yield GroupModel_1.default.create({ name, description, groupID });
    yield group.save();
    return res.send(group);
})));
// Join group
router.post("/join", (0, catchAsync_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { username, groupID } = req.body;
    const user = yield UserModel_1.default.findOne({ username });
    const group = yield GroupModel_1.default.findOne({ groupID });
    group.members.push(user);
    user.groups.push(group);
    yield group.save();
    yield user.save();
    return res.send(group);
})));
router.post("/:groupID/tasks", (0, catchAsync_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { groupID } = req.params;
    const { name } = req.body;
    const group = yield GroupModel_1.default.findOne({ groupID });
    const task = yield TaskModel_1.default.create({ name, complete: false });
    group.tasks.push(task);
    yield group.save();
    return res.send(group.tasks);
})));
router.get("/:groupID/tasks", (0, catchAsync_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { groupID } = req.params;
    const group = yield GroupModel_1.default.findOne({ groupID }).populate({
        path: "tasks",
        model: "Task"
    });
    return res.send(group.tasks);
})));
exports.default = router;
//# sourceMappingURL=groupRoutes.js.map