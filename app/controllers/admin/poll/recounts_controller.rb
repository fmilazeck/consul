class Admin::Poll::RecountsController < Admin::BaseController
  before_action :load_poll

  def index
    @booth_assignments = @poll.booth_assignments.
                              includes(:booth, :recounts, :final_recounts, :voters).
                              order(created_at: :desc).
                              page(params[:page]).per(50)
  end

  private

    def load_poll
      @poll = ::Poll.find(params[:poll_id])
    end
end