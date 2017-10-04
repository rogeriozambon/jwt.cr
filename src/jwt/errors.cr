module JWT::Errors
  class Decode < ::Exception; end
  class Verification < ::Exception; end
  class Audience < ::Exception; end
  class Expired < ::Exception; end
  class Issuer < ::Exception; end
  class NotReady < ::Exception; end
  class Subject < ::Exception; end
end
