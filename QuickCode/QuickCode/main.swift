//#!/usr/bin/env xcrun swift
// 使用脚本方案，上面行需要解除注释
//
//  main.swift
//  QuickCode
//
//  Created by rayor on 2022/2/25.
//
import Cocoa

let count = CommandLine.argc

if count < 3 {
    print("入参异常：至少需要两个参数")
    print("""
    入参规则：
    command type name
    type:   b/B 按钮 UIButton
            l/L 标签 UILabel
            i/I 图片 UIImageView
            v/V 视图 UIView
    
    name:   标签名称
    """)
    exit(1)
}

let t = CommandLine.arguments[1]        // 第一个参数，代表类型
let name = CommandLine.arguments[2]     // 第二个参数，代表名称

switch t.lowercased() {
case "b":
    print(buttonString(name))
case "l":
    print(labelString(name))
case "i":
    print(imageString(name))
case "v":
    print(viewString(name))
    
default: break
    
}



/*打印Button的样式*/
func buttonString(_ name :String) -> String {
    
    let methodName = name.first!.uppercased() + name.dropFirst()
    
    return """


/*<#comment#>*/
@property (nonatomic, strong) UIButton *\(name);



- (UIButton *)\(name) {
    if (!_\(name)) {
        _\(name) = [[UIButton alloc] init];
        [_\(name) setTitle:@"teset action" forState:UIControlStateNormal];
        [_\(name) setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];

        _\(name).titleLabel.textColor = UIColor.redColor;
        [_\(name) addTarget:self action:@selector(didClick\(methodName)Action:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _\(name);
}


- (void)didClick\(methodName)Action:(UIButton *)sender {
    NSLog(@"点击了按钮展示");
}


"""
}

func labelString(_ name:String) -> String {
    return """

/*<#comment#>*/
@property (nonatomic, strong) UILabel *\(name);


- (UILabel *)\(name) {
    if (!_\(name)) {
        _\(name) = [[UILabel alloc] init];
        _\(name).text = @"text tes";
        _\(name).textColor = UIColor.redColor;
        _\(name).font = [UIFont systemFontOfSize:12];
        _\(name).textAlignment = NSTextAlignmentCenter;
    }
    return _\(name);
}


"""
}


func imageString(_ name:String) -> String {
    return """


/*<#comment#>*/
@property (nonatomic, strong) UIImageView *\(name);



- (UIImageView *)\(name) {
    if (!_\(name)) {
        _\(name) = [[UIImageView alloc] init];
        _\(name).contentMode = UIViewContentModeScaleAspectFit;
        _\(name).backgroundColor = UIColor.redColor;
        _\(name).image = [UIImage imageNamed:@"1"];
        
    }
    return _\(name);
}


"""
}



func viewString(_ name:String) -> String {
    return """
/*<#视图#>*/
@property (nonatomic, strong) UIView *\(name);

- (UIView *)\(name) {
    if (!_\(name)) {
        _\(name) = [[UIView alloc] init];
        _\(name).backgroundColor = UIColor.redColor;
    }
    return _\(name);
}

"""
}




