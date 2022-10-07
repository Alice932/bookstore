# frozen_string_literal: true

require 'shrine'
require 'shrine/storage/file_system'
require 'shrine/storage/s3'

Shrine.plugin :activerecord           # loads Active Record integration
Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
Shrine.plugin :restore_cached_data

s3_options = {
  bucket: 'book-photos',
  access_key_id: Rails.application.credentials.aws.access_key_id,
  secret_access_key: Rails.application.credentials.aws.secret_access_key,
  region: 'us-west-1'
}

Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: 'cache', **s3_options),
  store: Shrine::Storage::S3.new(**s3_options)
}
