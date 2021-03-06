/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AWSTestUtility.h"
#import "AWSCognitoIdentity.h"

@interface AWSGeneralCognitoIdentityTests : XCTestCase

@end

@implementation AWSGeneralCognitoIdentityTests

- (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testConstructors {
    NSString *key = @"testCognitoIdentityConstructors";
    XCTAssertNotNil([AWSCognitoIdentity defaultCognitoIdentity]);
    XCTAssertEqual([[AWSCognitoIdentity defaultCognitoIdentity] class], [AWSCognitoIdentity class]);
    XCTAssertNil([AWSCognitoIdentity CognitoIdentityForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSCognitoIdentity CognitoIdentityForKey:key]);
    XCTAssertEqual([[AWSCognitoIdentity CognitoIdentityForKey:key] class], [AWSCognitoIdentity class]);
    XCTAssertEqual([AWSCognitoIdentity CognitoIdentityForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSCognitoIdentity removeCognitoIdentityForKey:key];
    XCTAssertNil([AWSCognitoIdentity CognitoIdentityForKey:key]);

}

- (void)testCreateIdentityPool {
    NSString *key = @"testCreateIdentityPool";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:configuration forKey:key];

    [[[[AWSCognitoIdentity CognitoIdentityForKey:key] createIdentityPool:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSCognitoIdentity removeCognitoIdentityForKey:key];
}

- (void)testDeleteIdentityPool {
    NSString *key = @"testDeleteIdentityPool";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:configuration forKey:key];

    [[[[AWSCognitoIdentity CognitoIdentityForKey:key] deleteIdentityPool:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSCognitoIdentity removeCognitoIdentityForKey:key];
}

- (void)testDescribeIdentity {
    NSString *key = @"testDescribeIdentity";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:configuration forKey:key];

    [[[[AWSCognitoIdentity CognitoIdentityForKey:key] describeIdentity:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSCognitoIdentity removeCognitoIdentityForKey:key];
}

- (void)testDescribeIdentityPool {
    NSString *key = @"testDescribeIdentityPool";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:configuration forKey:key];

    [[[[AWSCognitoIdentity CognitoIdentityForKey:key] describeIdentityPool:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSCognitoIdentity removeCognitoIdentityForKey:key];
}

- (void)testGetCredentialsForIdentity {
    NSString *key = @"testGetCredentialsForIdentity";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:configuration forKey:key];

    [[[[AWSCognitoIdentity CognitoIdentityForKey:key] getCredentialsForIdentity:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSCognitoIdentity removeCognitoIdentityForKey:key];
}

- (void)testGetId {
    NSString *key = @"testGetId";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:configuration forKey:key];

    [[[[AWSCognitoIdentity CognitoIdentityForKey:key] getId:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSCognitoIdentity removeCognitoIdentityForKey:key];
}

- (void)testGetIdentityPoolRoles {
    NSString *key = @"testGetIdentityPoolRoles";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:configuration forKey:key];

    [[[[AWSCognitoIdentity CognitoIdentityForKey:key] getIdentityPoolRoles:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSCognitoIdentity removeCognitoIdentityForKey:key];
}

- (void)testGetOpenIdToken {
    NSString *key = @"testGetOpenIdToken";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:configuration forKey:key];

    [[[[AWSCognitoIdentity CognitoIdentityForKey:key] getOpenIdToken:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSCognitoIdentity removeCognitoIdentityForKey:key];
}

- (void)testGetOpenIdTokenForDeveloperIdentity {
    NSString *key = @"testGetOpenIdTokenForDeveloperIdentity";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:configuration forKey:key];

    [[[[AWSCognitoIdentity CognitoIdentityForKey:key] getOpenIdTokenForDeveloperIdentity:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSCognitoIdentity removeCognitoIdentityForKey:key];
}

- (void)testListIdentities {
    NSString *key = @"testListIdentities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:configuration forKey:key];

    [[[[AWSCognitoIdentity CognitoIdentityForKey:key] listIdentities:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSCognitoIdentity removeCognitoIdentityForKey:key];
}

- (void)testListIdentityPools {
    NSString *key = @"testListIdentityPools";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:configuration forKey:key];

    [[[[AWSCognitoIdentity CognitoIdentityForKey:key] listIdentityPools:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSCognitoIdentity removeCognitoIdentityForKey:key];
}

- (void)testLookupDeveloperIdentity {
    NSString *key = @"testLookupDeveloperIdentity";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:configuration forKey:key];

    [[[[AWSCognitoIdentity CognitoIdentityForKey:key] lookupDeveloperIdentity:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSCognitoIdentity removeCognitoIdentityForKey:key];
}

- (void)testMergeDeveloperIdentities {
    NSString *key = @"testMergeDeveloperIdentities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:configuration forKey:key];

    [[[[AWSCognitoIdentity CognitoIdentityForKey:key] mergeDeveloperIdentities:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSCognitoIdentity removeCognitoIdentityForKey:key];
}

- (void)testSetIdentityPoolRoles {
    NSString *key = @"testSetIdentityPoolRoles";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:configuration forKey:key];

    [[[[AWSCognitoIdentity CognitoIdentityForKey:key] setIdentityPoolRoles:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSCognitoIdentity removeCognitoIdentityForKey:key];
}

- (void)testUnlinkDeveloperIdentity {
    NSString *key = @"testUnlinkDeveloperIdentity";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:configuration forKey:key];

    [[[[AWSCognitoIdentity CognitoIdentityForKey:key] unlinkDeveloperIdentity:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSCognitoIdentity removeCognitoIdentityForKey:key];
}

- (void)testUnlinkIdentity {
    NSString *key = @"testUnlinkIdentity";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:configuration forKey:key];

    [[[[AWSCognitoIdentity CognitoIdentityForKey:key] unlinkIdentity:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSCognitoIdentity removeCognitoIdentityForKey:key];
}

- (void)testUpdateIdentityPool {
    NSString *key = @"testUpdateIdentityPool";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:configuration forKey:key];

    [[[[AWSCognitoIdentity CognitoIdentityForKey:key] updateIdentityPool:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSCognitoIdentity removeCognitoIdentityForKey:key];
}

@end
