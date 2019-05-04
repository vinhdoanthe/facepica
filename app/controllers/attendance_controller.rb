# frozen_string_literal: true

class AttendanceController < HomeController
  include Constants
  before_action :client_initialied!, only: [:new]

  def new; end

  def attend
    @record = Attendance.new
    @record.snapshot.attach(data: params[:image])
    @record.topican = nil
    @record.authorized_client = nil

    ## Todo call to AWS Rekognition
    # content_type :json
    client = Aws::Rekognition::Client.new
    # Aws.config.update(
    #   region: 'us-east-1',
    #   credentials: Aws::Credentials.new(ENV['AWS_KEY'], ENV['AWS_SECRET'])
    # )
    response = client.search_faces_by_image(
      collection_id: Constants::FACE_COLLECTION,
      max_faces: 1,
      face_match_threshold: 95,
      image: {
        bytes: params[:image]
      }
    )
    if response.face_matches.count > 1
      { message: 'Too many faces found' }.to_json
    elsif response.face_matches.count == 0
      { message: 'No face detected!' }.to_json
    else
      # "Comparison finished - detected #{ response.face_matches[0].face.external_image_id } with #{ response.face_matches[0].face.confidence } accuracy."
      { id: response.face_matches[0].face.external_image_id, confidence: response.face_matches[0].face.confidence, message: 'Face found!' }.to_json
    end
  end

  def client_initialied!
    @client_secret = cookies[:client_secret]
    if @client_secret.nil?
      if current_user.nil?
        redirect_to new_user_session_path
      else
        redirect_to new_authorized_client_path
      end
    end
  end
end
