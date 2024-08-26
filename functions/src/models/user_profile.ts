import { Entity } from './entity'

export type UserProfile = Entity<UserProfileData>

export interface UserProfileData {
  name?: string
}
