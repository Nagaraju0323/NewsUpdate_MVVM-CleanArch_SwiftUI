//
//  NewsFactroy.swift
//  NewsUpdate
//
//  Created by Nagaraju on 18/12/24.
//

protocol ViewModelFactoryProtocol {
    func featchListViewModel() -> NewsViewModel
    
}


class ViewModelFactroy:ViewModelFactoryProtocol {
 
    @MainActor func featchListViewModel() -> NewsViewModel {
        let apiNetwork = APIServiceManager(NetworkManager:NetworkManager())
        let networkDataSource = NewsNetworkDataSourceImpl(apiSerice: apiNetwork)
        let repository = NewsRepository(networkDataSource: networkDataSource)
        let useCases = FetchNewsUseCase(repository: repository)
        return NewsViewModel(newsUseCase: useCases)
    }
}
