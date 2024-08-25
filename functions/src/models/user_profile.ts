import { Entity, EntityData } from './entity'

export type UserProfile = Entity<UserProfileData>

export interface UserProfileData extends EntityData {
  name?: string
}
