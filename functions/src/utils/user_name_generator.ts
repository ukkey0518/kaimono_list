import { prefixes, suffixes } from '../../data/user_name_data.json'

export function generateRandomUsername(): string {
  const randomPrefix = prefixes[Math.floor(Math.random() * prefixes.length)]
  const randomSuffix = suffixes[Math.floor(Math.random() * suffixes.length)]
  const randomNumber = Math.floor(Math.random() * 10000)
    .toString()
    .padStart(4, '0')
  return `${randomPrefix}${randomSuffix}#${randomNumber}`
}
