export type Entity<T extends { [field: string]: any }> = {
  id: string
} & T
