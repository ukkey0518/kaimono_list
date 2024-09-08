import { Entity } from './entity'

export type UserProfile = Entity<UserProfileData>

export interface UserProfileData {
  name: string
  status: UserStatus
}

export type UserStatus = 'active' | 'deleted'
