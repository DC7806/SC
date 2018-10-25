# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe 'GET index' do
    context 'when success' do
      before { get :index }

      it 'has a 200 status code' do
        expect(response.status).to eq(200)
      end

      it 'renders index page' do
        expect(response).to render_template(:index)
      end
    end
  end

  describe 'GET new' do
    context 'when success' do
      before { get :new }

      it 'has a 200 status code' do
        expect(response.status).to eq(200)
      end

      it 'renders new page' do
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET show' do
    context 'when success' do
      before { get :show, params: { id: FactoryBot.create(:product) } }

      it 'has a 200 status code' do
        expect(response.status).to eq(200)
      end

      it 'renders show page' do
        expect(response).to render_template(:show)
      end
    end
  end

  describe 'GET edit' do
    context 'when success' do
      before { get :edit, params: { id: FactoryBot.create(:product) } }

      it 'has a 200 status code' do
        expect(response.status).to eq(200)
      end

      it 'renders edit page' do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'POST create' do
    context 'with valid attributes' do
      it 'creates a new product' do
        expect do
          post :create, params: { product: FactoryBot.attributes_for(:product) }
        end.to change(Product, :count).by(1)
      end

      it 'redirects to index page' do
        post :create, params: { product: FactoryBot.attributes_for(:product) }
        expect(response).to redirect_to products_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new product' do
        expect do
          post :create, params: { product: FactoryBot.attributes_for(:invalid_product) }
        end.to_not change(Product, :count)
      end

      it 're-renders the new method' do
        post :create, params: { product: FactoryBot.attributes_for(:invalid_product) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT update' do
    let!(:product) { FactoryBot.create(:product) }

    context 'with valid attributes' do
      before do
        @attrs = { name: 'aa', description: 'bb', price: 22, published: true }
        put :update, params: { id: product.id, product: @attrs }
      end

      it 'updates product' do
        product.reload
        expect(product.name).to eq @attrs[:name]
        expect(product.description).to eq @attrs[:description]
        expect(product.price).to eq @attrs[:price]
        expect(product.published).to eq @attrs[:published]
      end

      it 'redirects to index page' do
        expect(response).to redirect_to products_path
      end
    end

    context 'with invalid attributes' do
      before { put :update, params: { id: product.id, product: FactoryBot.attributes_for(:invalid_product) } }

      it 'does not update product' do
        expect(product.name).to eq(product.name)
      end

      it 're-renders the edit method' do
        expect(response).to render_template :new
      end
    end
  end

  describe 'DELETE destroy' do
    context 'when success' do
      let!(:product) { FactoryBot.create(:product) }

      it 'deletes product' do
        expect do
          delete :destroy, params: { id: product }
        end.to change(Product, :count).by(-1)
      end

      it 'redirects to index page' do
        delete :destroy, params: { id: product }
        expect(response).to redirect_to products_path
      end
    end
  end
end
