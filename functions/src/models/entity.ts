export type EntityData = { [field: string]: unknown }

export type Entity<T extends EntityData> = {
  id: string
} & T
