shared_examples 'get success' do |options|
  options = options || {}
  params = options[:params] || {}

  describe '#index' do
    it 'get index successfully' do
      get options[:action], params
      expect(response).to be_success
    end

    it 'render correct template' do
      get options[:action], params
      expect(response).to render_template(options[:template])
    end

    Array(options[:assigns]).each do |var_name|
      it "assigns #{var_name} variable" do
        get options[:action], params
        expect(assigns(var_name)).not_to be_nil
      end
    end if options[:assigns]
  end
end

shared_examples 'new action' do |options|
  options = options || {}

  describe '#new' do
    it 'get new successfully' do
      get :new
      expect(response).to be_success
    end

    if options[:assigns]
      it "assigns @#{options[:assigns]} variable" do
        get :new
        expect(assigns(options[:assigns])).not_to be_nil
      end
    end

    it 'render correct template' do
      get :new
      expect(response).to render_template(:new)
    end
  end
end

shared_examples 'create action' do |options|
  options = options || {}
  raise ArgumentError, 'Specify a :valid key' unless options[:valid]
  raise ArgumentError, 'Specify an :invalid key' unless options[:invalid]
  raise ArgumentError, 'Specify an :model key' unless options[:model]

  describe '#create' do
    describe 'valid attributes' do
      it 'saves and redirect' do
        post :create, {options[:model].to_s.underscore => attributes_for(options[:valid])}
        expect(response.code).to eq('302')
      end

      it 'change the number of records' do
        expect{
          post :create, {options[:model].to_s.underscore => attributes_for(options[:valid])}
        }.to change(options[:model], :count).by(1)
      end
    end

    describe 'invalid attributes' do
      it 'return 200 response code' do
        post :create, {options[:model].to_s.underscore => attributes_for(options[:invalid])}
        expect(response).to be_success
      end

      it 'renders :new template' do
        post :create, {options[:model].to_s.underscore => attributes_for(options[:invalid])}
        expect(response).to render_template(:new)
      end

      it 'does not change the number of records' do
        expect{
          post :create, {options[:model].to_s.underscore => attributes_for(options[:invalid])}
        }.to change(options[:model], :count).by(0)
      end
    end
  end
end

shared_examples 'edit action' do |options|
  raise ArgumentError, 'Specify a :valid key' unless options[:valid]
  options = options || {}

  describe '#edit' do
    describe 'with valid id' do
      let(:resource) { create(options[:valid]) }

      it 'get edit successfully' do
        get :edit, id: resource.id
        expect(response).to be_success
      end

      it 'render correct template' do
        get :edit, id: resource.id
        expect(response).to render_template(:edit)
      end
    end
  end
end

shared_examples 'update action' do |options|
  options = options || {}
  raise ArgumentError, 'Specify a :valid key' unless options[:valid]
  raise ArgumentError, 'Specify an :invalid key' unless options[:invalid]
  raise ArgumentError, 'Specify an :model key' unless options[:model]

  describe '#update' do
    let(:resource) { create(options[:valid]) }

    describe 'valid attributes' do
      it 'saves and redirect' do
        patch :update, {id: resource.id, options[:model].to_s.underscore => attributes_for(options[:valid])}
        expect(response.code).to eq('302')
      end
    end

    describe 'invalid attributes' do
      it 'return 200 response code' do
        patch :update, {id: resource.id, options[:model].to_s.underscore => attributes_for(options[:invalid])}
        expect(response).to be_success
      end

      it 'renders :edit template' do
        patch :update, {id: resource.id, options[:model].to_s.underscore => attributes_for(options[:invalid])}
        expect(response).to render_template(:edit)
      end
    end
  end
end

shared_examples 'destroy action' do |options|
  options = options || {}
  raise ArgumentError, 'Specify a :valid key' unless options[:valid]
  raise ArgumentError, 'Specify an :model key' unless options[:model]

  describe '#destroy' do
    it 'change the number of records' do
      resource = create(options[:valid])
      expect{
        delete :destroy, id: resource.id
      }.to change(options[:model], :count).by(-1)
    end
  end
end
