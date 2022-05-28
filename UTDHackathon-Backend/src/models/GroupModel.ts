// name
// members
// id
// description
// tasks
import * as mongoose from 'mongoose';
import { getModelForClass, prop } from "@typegoose/typegoose";
import { User } from './UserModel';
import { Task } from './TaskModel';

export class Group {
    @prop({ required: true })
    public name: string;

    @prop({ required: true })
    public description: string;

    @prop({ required: true })
    public groupID: string;

    @prop({ unique: true, ref: "users" })
    public members: [User];

    @prop({ unique: true, ref: "tasks" })
    public tasks: [Task];
}

export default getModelForClass(Group);
