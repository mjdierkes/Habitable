import * as mongoose from 'mongoose';
import { getModelForClass, prop, pre, post } from "@typegoose/typegoose";
import { Group } from './GroupModel';

export class User {
    @prop({ required: true })
    public name: string;

    @prop({ required: true })
    public username: string;

    @prop({ required: true })
    public password: string;

    @prop({ unique: true, ref: "groups" })
    public groups: [Group]
};

export default getModelForClass(User);