import { UserProfileRepository } from '../repositories/user_profile_repository'
import { generateRandomUsername } from '../utils/user_name_generator'
import * as logger from 'firebase-functions/logger'

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
   * Creates a new user profile with a default username if the profile does not already exist for the given user ID.
   *
   * @param {string} userId - The unique identifier of the user for whom the profile is being created.
   * @returns {Promise<boolean>} - A Promise that resolves to `true` if a new profile is successfully created,
   * and `false` if a profile already exists for the given `userId`.
   */
  async createNewUserProfile(userId: string): Promise<boolean> {
    if (await this.userProfileRepository.isExists(userId)) {
      logger.debug(`User profile already exists for user ID: ${userId}`)
      return false
    }
    const userName = await this.generateDefaultUserName()
    await this.userProfileRepository.create(userId, {
      name: userName,
    })
    logger.debug(`New user profile created for user ID: ${userId}`)
    return true
  }
}
