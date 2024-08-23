import { UserProfileRepository } from '../repositories/user_profile_repository'

export class UserService {
  constructor(private userProfileRepository: UserProfileRepository) {}

  // Create an empty user profile if it does not exist.
  // This is called when a new user is created.
  // If the user profile already exists, this function does nothing.
  async createEmptyUserProfile(userId: string): Promise<void> {
    if (await this.userProfileRepository.isExists(userId)) {
      return
    }
    await this.userProfileRepository.create(userId, {})
  }
}
