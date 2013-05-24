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

  factory :awesomeproject, class: Project do
    name                  "Awesomeproject"
  end

  factory :niceproject, class: Project do
    name                 "Niceproject"
  end

  factory :tracking_awesomeproject, class: Tracking do
    description           "Build an awesome webproject"
    start_time            "2013-04-08 13:00:00"
    minutes               120
    billable              true
    user_id               1
    project_id            1
  end

  factory :tracking_niceproject, class: Tracking do
    description           "Build a nice webproject"
    start_time            "2013-04-08 13:00:00"
    minutes               120
    billable              true
    user_id               1
    project_id            2
  end
end
