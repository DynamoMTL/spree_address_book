module Spree
  module Api
    class AddressBookController < Spree::Api::BaseController
      before_action :find_address, except: [:create]

      def create
        @address = current_api_user.addresses.build(address_params)
        if @address.save
          render json: @address
        else
          invalid_resource!(@address)
        end
      end

      def update
        if @address.editable?
          if @address.update_attributes(address_params)
            render json: @address
          else
            invalid_resource!(@address)
          end
        else
          # create a new one from the existing address
          new_address = @address.clone
          new_address.save

          # delete thee existing
          @address.update_attribute(:deleted_at, Time.now)

          render json: new_address
        end
      end

      def destroy
        @address.destroy_with_saving_used

        render json: @address
      end

      # touch so it comes out at the top of the list when addresses are fetch
      def set_default
        @address.touch

        render json: @address
      end

    private
      def find_address
        @address ||= Spree::Address.accessible_by(current_ability, :read).find(params[:id])
      end

      def address_params
        params.require(:address).permit(permitted_address_attributes)
      end
    end
  end
end