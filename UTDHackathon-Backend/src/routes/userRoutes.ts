import express from "express";
import { Request, Response } from "express";

import UserModel from "../models/UserModel";
import catchAsync from "../utils/catchAsync";

const router = express.Router();

// Create
router.post("/", catchAsync(async(req: Request, res: Response) => {
    const { username, password, name } = req.body;

    const user = await UserModel.create({ name, username, password });

    await user.save();

    return res.send(user);
}));

router.get("/:username/groups", catchAsync(async(req: Request, res: Response) => {
    const { username } = req.params;

    const user = await UserModel.findOne({ username }).populate({
        path: "groups",
        model: "Group"
    })

   return res.send(user.groups);
}));

router.get("/:username/tasks", catchAsync(async(req: Request, res: Response) => {
    const { username } = req.params;

    const user = await UserModel.findOne({ username }).populate({
        path: "groups",
        model: "Group"
    });
}));

export default router;