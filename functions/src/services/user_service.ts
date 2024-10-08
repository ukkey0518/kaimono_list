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
   * Creates a new user profile for a given user ID if it doesn't already exist.
   *
   * @param {string} userId - The unique identifier of the user for whom the profile is being created.
   * @returns {Promise<boolean>} - A Promise that resolves to `true` if a new profile is successfully created,
   * and `false` if a profile already exists for the provided `userId`.
   */
  async createNewUserProfile(userId: string): Promise<boolean> {
    if (await this.userProfileRepository.isExists(userId)) {
      logger.warn(`User profile already exists for user ID: ${userId}`)
      return false
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
