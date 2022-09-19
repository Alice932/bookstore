# frozen_string_literal: true

FactoryBot.define do
  factory(:address) do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    address { FFaker::Address.street_address }
    city { FFaker::Address.city }
    zip { FFaker::AddressUA.zip_code }
    country { FFaker::Address.country_code }
    phone { FFaker::PhoneNumberUA.international_home_phone_number }
    user

    trait :billing_address do
      type { I18n.t('address.type_billing') }
    end

    trait :shipping_address do
      type { I18n.t('address.type_shipping') }
    end
  end
end
