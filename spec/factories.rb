require 'spec_helper'

FactoryGirl.define do
  factory :user do
  	email                 "test@prellele.de"
    password              "secret01"
    password_confirmation "secret01"
    admin                 false
  end

  factory :admin, class: User do
    email                 "admin@prellele.de"
    password              "00test00"
    password_confirmation "00test00"
    admin                 true
  end
end
