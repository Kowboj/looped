import Foundation
import RxSwift

protocol LoginServiceProtocol {
    func login(username: String, password: String) -> Single<Session>
}

final class LoginService: LoginServiceProtocol {
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    // MARK: - Properties
    
    private let apiClient: APIClient
    
    // MARK: - Public
    
    func login(username: String, password: String) -> Single<Session> {
        return apiClient.send(request: LoginRequest(username: username, password: password))
            .map { try JSONDecoder().decode(LoginResponse.self, from: $0.data!) }
            .map { Session(token: $0.access_token, refreshToken: $0.refresh_token) }
            .asObservable()
            .asSingle()
    }
}
