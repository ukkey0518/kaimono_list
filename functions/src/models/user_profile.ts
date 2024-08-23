import { Entity } from './entity'

export interface UserProfile extends Entity<UserProfileData> {}

export interface UserProfileData {
  name?: string
}
