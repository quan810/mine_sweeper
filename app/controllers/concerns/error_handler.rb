# frozen_string_literal: true

module ErrorHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_record_errors
    rescue_from ActionController::BadRequest, with: :render_bad_request_errors
  end

  def render_invalid_record_errors(error)
    render_error(error.record.errors.full_messages, :unprocessable_entity)
  end

  def render_bad_request_errors(error)
    render_error([error.message], :bad_request)
  end

  def render_error(errors, status)
    @errors = errors
    respond_to do |format|
      format.html { render :new, status: }
      format.json { render json: errors, status: }
    end
  end
end
