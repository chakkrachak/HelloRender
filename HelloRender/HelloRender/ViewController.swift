//
//  ViewController.swift
//  HelloRender
//
//  Created by Chakkra CHAK on 28/08/2017.
//  Copyright © 2017 Kisio Digital. All rights reserved.
//

import UIKit
import Render

struct TextState: StateType {
    let text: String = "Hello Render"
}

class TextComponentView: ComponentView<TextState> {
    override func render() -> NodeType {
        let text = Node<UILabel>{ view, layout, size in
            view.text = "\(self.state.text)"
        }

        let container = Node<UIView> { view, layout, _ in

        }

        return container.add(child: text)
    }
}

class ViewController: UIViewController, ComponentController {
    typealias C = TextComponentView
    lazy var component: TextComponentView = TextComponentView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addComponentToViewControllerHierarchy()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidLayoutSubviews() {
        renderComponent(options: [.preventViewHierarchyDiff])
    }

    func configureComponentProps() {
    }
}