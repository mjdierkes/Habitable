import express from "express";
import { Request, Response } from "express";
import TaskModel from "../models/TaskModel";
import { v4 as uuidv4 } from 'uuid';

import GroupModel from "../models/GroupModel";
import UserModel from "../models/UserModel";
import catchAsync from "../utils/catchAsync";

const router = express.Router();

// Create
router.post("/", catchAsync(async(req: Request, res: Response) => {
    const { name, description } = req.body;
    const groupID = uuidv4();

    const group = await GroupModel.create({ name, description, groupID });

    await group.save();

    return res.send(group);
}));

// Join group
router.post("/join", catchAsync(async(req: Request, res: Response) => {
    const { username, groupID } = req.body;

    const user = await UserModel.findOne({ username });
    const group = await GroupModel.findOne({ groupID });

    group.members.push(user);
    user.groups.push(group);

    await group.save();
    await user.save();

    return res.send(group);
}));

router.post("/:groupID/tasks", catchAsync(async(req: Request, res: Response) => {
    const { groupID } = req.params;
    const { name } = req.body

    const group = await GroupModel.findOne({ groupID });

    const task = await TaskModel.create({ name, complete: false });

    group.tasks.push(task);

    await group.save();

    return res.send(group.tasks);
}))


router.get("/:groupID/tasks", catchAsync(async(req: Request, res: Response) => {
    const { groupID } = req.params;

    const group = await GroupModel.findOne({ groupID }).populate({
        path: "tasks",
        model: "Task"
    });

    return res.send(group.tasks);
}))

export default router;