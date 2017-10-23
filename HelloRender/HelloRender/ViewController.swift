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
    var text: String = "Hello Render"
}

class TextComponentView: ComponentView<TextState> {
    override func render() -> NodeType {
        let text = Node<UILabel>{ view, layout, size in
            view.text = "\(self.state.text)"
            view.textColor = UIColor(red:1.0, green:1.0, blue:1.0, alpha:1.0)
        }

        let container = Node<UIView> { view, layout, _ in
            view.backgroundColor = UIColor(red:0, green:0.62, blue:0.88, alpha:1.0)
            view.onTap { _ in
                self.setState { state in
                    state.text = "Text changed"
                }
            }
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
