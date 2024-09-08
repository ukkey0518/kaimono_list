import * as logger from 'firebase-functions/logger'
import { UserProfileRepository } from '../repositories/user_profile_repository'
import { generateRandomUsername } from '../utils/user_name_generator'

export class UserService {
  constructor(private userProfileRepository: UserProfileRepository) {}

  /**
   * Generates a random username and checks if it already exists in the user profile repository.
   * If it does, a new username is generated until a unique one is found.
   *
   * @returns {Promise<string>} - A Promise resolving to a unique generated username.
   */
  async generateDefaultUserName(): Promise<string> {
    let userName = generateRandomUsername()
    logger.debug(`Generated default username: ${userName}`)
    while (await this.userProfileRepository.isUserNameMatched(userName)) {
      logger.debug(`Username ${userName} already exists. Regenerating...`)
      userName = generateRandomUsername()
    }
    logger.debug(`Unique username generated: ${userName}`)
    return userName
  }

  /**
   * Checks if a user profile exists and either reactivates it or creates a new one with an active status.
   *
   * @param {string} userId - The unique identifier of the user for whom the profile is to be created or reactivated.
   * @returns {Promise<boolean>} - A Promise that resolves to a boolean indicating the result:
   * `true` if the profile was successfully created or reactivated, and `false` if the profile already exists and is active.
   */
  async createOrReactivateUserProfile(userId: string): Promise<boolean> {
    const existingProfile = await this.userProfileRepository.get(userId)
    if (existingProfile) {
      switch (existingProfile.status) {
        case 'active':
          logger.warn(`User profile already exists and is active for user ID: ${userId}`)
          // TODO: Send an alert to the system administrator
          return false
        case 'deleted':
          await this.userProfileRepository.update(userId, {
            status: 'active',
          })
          logger.debug(`User profile reactivated for user ID: ${userId}`)
          return true
        default:
          logger.error(
            `Unexpected user profile status: ${existingProfile.status} for user ID: ${userId}`
          )
          // TODO: Send an alert to the system administrator
          return false
      }
    }

    const defaultUserName = await this.generateDefaultUserName()
    await this.userProfileRepository.create(userId, {
      name: defaultUserName,
      status: 'active',
    })
    logger.debug(`New user profile created for user ID: ${userId}`)
    return true
  }

  /**
   * Sets the status of a user to 'deleted'.
   * This is a soft delete operation, and the user profile is not removed from the database.
   *
   * @param {string} userId - The unique identifier of the user whose status is being updated to 'deleted'.
   */
  async setUserStatusToDeleted(userId: string): Promise<void> {
    await this.userProfileRepository.update(userId, {
      status: 'deleted',
    })
  }
}
