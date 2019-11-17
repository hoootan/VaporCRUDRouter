import Vapor

public enum ChildrenRouterMethod {
    case read
    case readAll
    case create
    case update
    case delete

    func register<ChildType, ParentType>(
        router: RoutesBuilder,
        controller: CrudChildrenController<ChildType, ParentType>,
        path: [PathComponent],
        idPath: [PathComponent]
    ) {
        switch self {
        case .read:
            router.get(idPath, use: controller.index)
        case .readAll:
            router.get(path, use: controller.indexAll)
        case .create:
            router.post(path, use: controller.create)
        case .update:
            router.put(idPath, use: controller.update)
        case .delete:
            router.delete(idPath, use: controller.delete)
        }
    }
}
