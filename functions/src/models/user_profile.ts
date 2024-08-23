import { Entity, EntityData } from './entity'

export interface UserProfile extends Entity<UserProfileData> {}

export interface UserProfileData extends EntityData {
  name?: string
}
