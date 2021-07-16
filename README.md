# NewsApp  
it's a sample app with two scenes which you can search about news and checking its details also navigating to the source.

## Behaviors
 - VIPER Archtiecture (View , Interactor , Presenter , Entity , Router)
 
 
 ![VIPERGIFTEXT](https://user-images.githubusercontent.com/42733811/69058784-fe4c5980-0a1c-11ea-9e85-6d86fb038276.gif) ![s](https://user-images.githubusercontent.com/42733811/69059518-5f286180-0a1e-11ea-8e53-1e93d618c110.gif)
 ![Screen Shot 2021-07-16 at 9 49 08 PM](https://user-images.githubusercontent.com/42733811/126001685-90dc393b-128e-448a-9091-dc5eaf065672.png)

 - AutoLayout Programaticlly using Anchors

```ruby

    private func setupArticleSourceViewConstraints() {
        NSLayoutConstraint.activate([
            self.articleSourceView.topAnchor.constraint(equalTo: self.articleDescriptionLabel.bottomAnchor, constant: 10),
            self.articleSourceView.leadingAnchor.constraint(equalTo: self.headerContainerView.leadingAnchor, constant: 12),
            self.articleSourceView.trailingAnchor.constraint(equalTo: self.headerContainerView.trailingAnchor, constant: -12)
        ])
    }

    private func setupArticleContentViewConstraints() {
        NSLayoutConstraint.activate([
            self.articleContentView.topAnchor.constraint(equalTo: self.articleSourceView.bottomAnchor, constant: 10),
            self.articleContentView.leadingAnchor.constraint(equalTo: self.headerContainerView.leadingAnchor, constant: 12),
            self.articleContentView.trailingAnchor.constraint(equalTo: self.headerContainerView.trailingAnchor, constant: -12),
            self.articleContentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -30)
        ])
    }
```

 - Dark Mode Enabled
 - Pagination Enabled
 
 ## Pods
 - Alamofire https://github.com/Alamofire/Alamofire
 - SwiftLint  https://github.com/realm/SwiftLint
 - SwiftFormat https://github.com/nicklockwood/SwiftFormat
 - KingFisher https://github.com/onevcat/Kingfisher