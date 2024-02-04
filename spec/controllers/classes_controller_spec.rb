require 'rails_helper'

RSpec.describe ClassesController, type: :controller do
  before do
    ENV['TOKEN'] = 'test_token'
    request.headers['X-Auth-Token'] = 'test_token'
  end

  let!(:school) { School.find_or_create_by(id: 1) }
  let!(:school_class) do
    School::Class.find_or_create_by(
      school_id: school.id,
      number: 1,
      letter: 'A'
    )
  end
  let!(:student) do
    Student.find_or_create_by(
      first_name: 'Иван',
      last_name: 'Иванов',
      surname: 'Иванович',
      school_class_id: school_class.id,
      school_id: school.id
    )
  end

  describe 'when the authorization token did not arrive' do
    before do
      ENV['TOKEN'] = 'test_token'
      request.headers['X-Auth-Token'] = ''
    end

    it 'returns forbidden 403 status' do
      expect { get :index, params: { school_id: school.id } }.to raise_error('Forbidden')
    end
  end

  describe 'GET index' do
    it 'has a 200 status code' do
      get :index, params: { school_id: school.id }

      expect(response.status).to eq(200)
    end

    it 'a response hash contains necessary keys' do
      get :index, params: { school_id: school.id }
      expected_records = [{ 'id' => school_class.id,
                            'number' => school_class.number,
                            'school_id' => school.id }]

      response_records = JSON.parse(response.body)

      expect(response_records).to include(a_hash_including(*expected_records))
    end
  end
end
