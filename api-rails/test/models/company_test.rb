require "test_helper"

class CompanyTest < ActiveSupport::TestCase
  test 'can create a new company' do
    assert Company.create(name: 'Bolillos Inc', description: 'I+D company specialized on new features for bolillos.')
  end

  test 'cannot create a company without name' do
    company = Company.new(description: 'We are a nameless company')
    assert_not company.valid?
  end

  test 'can destroy a company' do
    assert_difference 'Company.count', -1 do
      companies(:one).destroy
    end
  end
end
