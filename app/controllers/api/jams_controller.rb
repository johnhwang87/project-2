module API
    class JamsController < ApplicationController

      def index
        render json: Jam.all
      end

      def show
        render json: Jam.find(params[:id])
      end

  end
end
