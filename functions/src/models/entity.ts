/**
 * Represents an entity with a unique identifier.
 *
 * @template T - The type of the entity's properties.
 * @property id - The unique identifier for the entity.
 */
export type Entity<T> = {
  id: string
} & T
