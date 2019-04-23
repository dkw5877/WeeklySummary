//
//  GraphView.swift
//  WeeklySummary
//
//  Created by user on 4/16/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class GraphView: UIView {

    var data = [0.5, 0.9, 0.3, 0.6, 0.7, 0.5, 0.8]
    var labels = ["SUN", "MON", "TUE", "WED","THU", "FRI", "SAT"]
    
    private let graphStackView = UIStackView()
    private let titleStackView = UIStackView()
    private let labelsStackView = UIStackView()
    private var gradientConstraints = [NSLayoutConstraint]()
    
    private var columnWidth:CGFloat = 10
    private var cornerRadius:CGFloat = 5

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setupSummary()
        setupGraphStackView()
        addColumnTracks()
        addGradientViews()
        setupLabelsStackView()
    }
    
    private func setupSummary() {
        let separatorView = UIView()
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.backgroundColor = Theme.whiteColor
        addSubview(separatorView)
        
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: topAnchor,constant: 16),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1.0)
            ])
        
        titleStackView.axis = .horizontal
        titleStackView.alignment = .fill
        titleStackView.distribution = .fill
        titleStackView.spacing = 5
        titleStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleStackView)
        NSLayoutConstraint.activate([
            titleStackView.topAnchor.constraint(equalTo: separatorView.topAnchor, constant: 32),
            titleStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            ])
        
        addLabel(text: "RUNNING LEVEL", stackView: titleStackView, color: Theme.purpleTextColor)
        addLabel(text: "Week 2 of May", stackView: titleStackView)
    }
    
    private func addLabel(text:String, stackView:UIStackView, color:UIColor = Theme.textColor) {
        let label = UILabel()
        label.font = Fonts.caption
        label.textAlignment = .left
        label.textColor = color
        label.text = text
        label.sizeToFit()
        stackView.addArrangedSubview(label)
    }
    
    private func setupGraphStackView() {
        graphStackView.translatesAutoresizingMaskIntoConstraints = false
        graphStackView.axis = .horizontal
        graphStackView.alignment = .fill
        graphStackView.distribution = .equalSpacing
        addSubview(graphStackView)
        
        NSLayoutConstraint.activate([
            graphStackView.topAnchor.constraint(equalTo:titleStackView.bottomAnchor, constant: 16),
            graphStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            graphStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
        ])
    }
    
    private func addColumnTracks() {
        for _ in 0..<data.count {
            let track = UIView()
            track.widthAnchor.constraint(equalToConstant: columnWidth).isActive = true
            track.layer.cornerRadius = cornerRadius
            track.backgroundColor = Theme.mutedMainColor
            graphStackView.addArrangedSubview(track)
        }
    }
    
    private func addGradientViews() {
        for i in 0..<data.count {
            let track = graphStackView.arrangedSubviews[i]
            let gradient = GradientView()
            gradient.translatesAutoresizingMaskIntoConstraints = false
            gradient.layer.cornerRadius = cornerRadius
            track.addSubview(gradient)
            let height:CGFloat = graphStackView.frame.height * CGFloat(data[i])
            let constraint = gradient.heightAnchor.constraint(equalToConstant: height)
            constraint.isActive = true
            gradientConstraints.append(constraint)
            
            NSLayoutConstraint.activate([
                gradient.leadingAnchor.constraint(equalTo: track.leadingAnchor),
                gradient.trailingAnchor.constraint(equalTo: track.trailingAnchor),
                gradient.bottomAnchor.constraint(equalTo: track.bottomAnchor)
            ])
        }
    }
    
    private func setupLabelsStackView() {
        
        labelsStackView.axis = .horizontal
        labelsStackView.alignment = .center
        labelsStackView.distribution = .equalCentering
        addSubview(labelsStackView)
    
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo:graphStackView.bottomAnchor, constant: 16),
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            ])
        
        for text in labels {
            addLabel(text: text, stackView: labelsStackView)
        }
        
        let separatorView = UIView()
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.backgroundColor = Theme.whiteColor
        addSubview(separatorView)
        
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: labelsStackView.bottomAnchor, constant: 32),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            separatorView.heightAnchor.constraint(equalToConstant: 1.0)
            ])
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        graphStackView.setNeedsLayout()
        
        for (i, constraint) in gradientConstraints.enumerated() {
            let height:CGFloat = graphStackView.frame.height * CGFloat(data[i])
            constraint.constant = height
        }
    }

}
