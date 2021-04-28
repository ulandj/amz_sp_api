require 'aws-sigv4'

require 'api_error'
require 'api_client'

module AmzSpApi
  class SpApiClient2 < ApiClient

    def initialize(config = SpConfiguration.default)
      super(config)
    end

    alias_method :super_call_api, :call_api
    def call_api(http_method, path, opts = {})
      unsigned_request = build_request(http_method, path, opts)
      aws_headers = auth_headers(http_method, unsigned_request.url, unsigned_request.encoded_body)
      signed_opts = opts.merge(:header_params => aws_headers.merge(opts[:header_params] || {}))
      super(http_method, path, signed_opts)
    end

    private

    def signed_request_headers(http_method, url, body)
      request_config = {
        service: 'execute-api',
        region: config.aws_region
      }
      if config.credentials_provider
        request_config[:credentials_provider] = config.credentials_provider
      else
        request_config[:access_key_id] = config.aws_access_key_id
        request_config[:secret_access_key] = config.aws_secret_access_key
      end
      signer = Aws::Sigv4::Signer.new(request_config)
      signer.sign_request(http_method: http_method.to_s, url: url, body: body).headers
    end

    def auth_headers(http_method, url, body)
      signed_request_headers(http_method, url, body).merge({
                                                             'x-amz-access-token' => config.refresh_token
                                                           })
    end
  end
end
