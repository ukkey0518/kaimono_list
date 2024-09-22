import { Entity } from './entity'

export type UserProfile = Entity<UserProfileData>

/**
 * Represents the data structure for a user profile.
 *
 * @property {string} name - The name of the user.
 * @property {UserStatus} status - The status of the user.
 */
export interface UserProfileData {
  name: string
  status: UserStatus
}

/**
 * Represents the status of a user.
 *
 * @property {'active'} active - Indicates that the user is active.
 * @property {'deleted'} deleted - Indicates that the user has been deleted.
 */
export type UserStatus = 'active' | 'deleted'
