require 'rails_helper'

RSpec.describe "Sequences", type: :request do
  describe "GET /input" do
    before { get root_path }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders input template' do
      expect(response).to render_template(:input)
    end

    it 'responds with html' do
      expect(response.content_type).to match(%r{text/html})
    end
  end

  describe "GET /result" do
    context 'when xml and valid params' do
      before { get sequences_show_path, params: { number: 3, string_array: '1 4 16', mode: 'xml' } }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'responds with xml' do
        expect(response.content_type).to eq('application/xml; charset=utf-8')
      end

      it 'assigns valid model object' do
        expect(assigns(:result).valid?).to be true
      end
    end

    context 'when xml and invalid params' do
      before { get sequences_show_path, params: { number: 4, string_array: '1 4 16', mode: 'xml' } }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders result templates' do
        expect(response).to render_template(:show)
      end

      it 'responds with html' do
        expect(response.content_type).to match(%r{text/html})
      end

      it 'assigns invalid model object' do
        expect(assigns(:result).valid?).to be false
      end
    end

    context 'when html-server and valid params' do
      before { get sequences_show_path, params: { number: 3, string_array: '1 4 16', mode: 'html-server' } }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'responds with html' do
        expect(response.content_type).to match(%r{text/html})
      end

      it 'assigns valid model object' do
        expect(assigns(:result).valid?).to be true
      end
    end

    context 'when html-server and invalid params' do
      before { get sequences_show_path, params: { number: 4, string_array: '1 4 16', mode: 'html-server' } }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders input template' do
        expect(response).to render_template(:show)
      end

      it 'responds with html' do
        expect(response.content_type).to match(%r{text/html})
      end

      it 'assigns valid model object' do
        expect(assigns(:result).valid?).to be false
      end
    end

    context 'when html-client and valid params' do
      before { get sequences_show_path, params: { number: 3, string_array: '1 4 16', mode: 'html-client' } }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'responds with html' do
        expect(response.content_type).to match('application/xml; charset=utf-8')
      end

      it 'assigns valid model object' do
        expect(assigns(:result).valid?).to be true
      end
    end

    context 'when html-client and invalid params' do
      before { get sequences_show_path, params: { number: 4, string_array: '1 4 16', mode: 'html-client' } }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders input template' do
        expect(response).to render_template(:show)
      end

      it 'responds with html' do
        expect(response.content_type).to match(%r{text/html})
      end

      it 'assigns valid model object' do
        expect(assigns(:result).valid?).to be false
      end
    end
  end
end
