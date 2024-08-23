export type EntityData = { [field: string]: any }

export type Entity<T extends EntityData> = {
  id: string
} & T
